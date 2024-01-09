using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;
using Microsoft.Office.Interop.Excel;

namespace SQLWebApplication
{
    public partial class Conversations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                LabelSession.Text = "Добро пожаловать, " +
                Session["login"].ToString() + "!!!";
            }


        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {

                    // получить данные из SqlDataSourcefilials
                    DataView dsfil = (DataView)SqlDataSourceSubscribers.Select(DataSourceSelectArguments.Empty);
                    // получить значение текущего филиала
                    DataRowView view = (DataRowView)e.Row.DataItem;
                    int Filname = 0;
                    if (view.Row[1] != null && view.Row[1] != DBNull.Value)
                    {
                        int.TryParse(view.Row[1].ToString(), out Filname);
                    }
                    // отфильтровать нужый филиал
                    dsfil.RowFilter = string.Format("kob_sub='{0}'", Filname);
                    // устанавливаем необходимое значение в элемент Label1 
                    // получить данные из SqlDataSourceVidstrahovaniya
                    DataView dsstrah = (DataView)SqlDataSourceCities.Select(DataSourceSelectArguments.Empty);
                    DataRowView view2 = (DataRowView)e.Row.DataItem;
                    // получить значение текущего вида страхования
                    int strahname = 0;
                    if (view2.Row[2] != null && view2.Row[2] != DBNull.Value)
                    {
                        int.TryParse(view2.Row[2].ToString(), out strahname);
                    }
                    // отфильтровать нужый вид страхования
                    dsstrah.RowFilter = string.Format("kod_city='{0}'", strahname);
                    // устанавливаем необходимое значение в элемент Label2 
                }

        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var app = new Microsoft.Office.Interop.Word.Application();
            // Создание нового документа на основе Normal.dot
            Object template = Type.Missing;
            Object newTemplate = Type.Missing;
            Object documentType = Type.Missing;
            Object visible = Type.Missing;
            app.Visible = true;
            var doc = app.Documents.Add(ref template, ref newTemplate, ref documentType, ref visible);
            // Устанавливаем Range на первый абзац
            var rng = doc.Range();
            //Изменяем параметры форматирования
            rng.Font.Size = 16;
            rng.Font.Name = "Arial";
            rng.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
            //вставляем заголовок
            rng.Text = "Проведенные переговоры";

            //Добавляем в документ второй абзац
            Microsoft.Office.Interop.Word.Paragraph p = rng.Paragraphs.Add();
            // Устанавливаем Range на второй абзац
            rng = doc.Paragraphs[2].Range;
            //Вставляем текущую дату
            rng.Text = DateTime.Today.ToShortDateString();

            //Добавляем в документ третий абзац
            rng.Paragraphs.Add();
            // Изменяем параметры форматирования
            rng.Font.Size = 12;
            rng.Font.Name = "Times New Roman";
            rng.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphJustify;
            //rng.Select();

            // Устанавливаем Range на третий абзац
            rng = doc.Paragraphs[3].Range;
            //вставляем таблицу
            Object defaultTableBehavior = Type.Missing;
            Object autoFitBehavior = Type.Missing;
            //создаем объект таблицы (изначально - только шапка)
            Microsoft.Office.Interop.Word.Table tbl = rng.Tables.Add(rng, 1, 7, ref defaultTableBehavior, ref autoFitBehavior);

            //Форматируем таблицу и применяем стиль
            Object style = "Сетка таблицы";
            tbl.set_Style(ref style);
            //шапка таблицы
            tbl.Cell(1, 1).Range.Text = "Номер переговоров";
            tbl.Cell(1, 2).Range.Text = "Абонент";
            tbl.Cell(1, 3).Range.Text = "Город";
            tbl.Cell(1, 4).Range.Text = "Дата";
            tbl.Cell(1, 5).Range.Text = "Минуты";
            tbl.Cell(1, 6).Range.Text = "Время";
            tbl.Cell(1, 7).Range.Text = "Стоимость";
            //i - общее количество строк в формируемой таблице
            int i = 1;


            foreach (GridViewRow row in GridView2.Rows)
            {
                Object beforeRow = Type.Missing;
                tbl.Rows.Add(ref beforeRow);
                tbl.Cell(i + 1, 1).Range.Text = Convert.ToString(row.Cells[0].Text);
                tbl.Cell(i + 1, 2).Range.Text = Convert.ToString(row.Cells[1].Text);
                tbl.Cell(i + 1, 3).Range.Text = Convert.ToString(row.Cells[2].Text);
                tbl.Cell(i + 1, 4).Range.Text = Convert.ToString(row.Cells[3].Text);
                tbl.Cell(i + 1, 5).Range.Text = Convert.ToString(row.Cells[4].Text);
                tbl.Cell(i + 1, 6).Range.Text = Convert.ToString(row.Cells[5].Text);
                tbl.Cell(i + 1, 7).Range.Text = Convert.ToString(row.Cells[6].Text);
                i++;
            }
            //шапку таблицы выделяем курсивом
            tbl.Rows[1].Range.Font.Italic = 1;
            //и устанавливаем выравнивание по центру
            tbl.Rows[1].Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
            //отображаем сформированный документ
            app.Visible = true;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var app = new Microsoft.Office.Interop.Excel.Application();
            // Создание нового документа
            var workbooks = app.Workbooks;
            var workbook = workbooks.Add();
            var sheet = workbook.Sheets[1];
            sheet.Name = "Проведенные переговоры";

            //Изменяем параметры форматирования
            sheet.Cells.Font.Size = 16;
            sheet.Cells.Font.Name = "Arial";
            sheet.Cells.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;

            //вставляем заголовок
            sheet.Cells[1, 1] = "Проведенные переговоры";

            //Вставляем текущую дату
            sheet.Cells[2, 1] = DateTime.Today.ToShortDateString();

            //создаем объект таблицы
            Microsoft.Office.Interop.Excel.Range rng = sheet.Range[sheet.Cells[3, 1], sheet.Cells[3, 7]];

            var tbl = sheet.ListObjects.Add(Microsoft.Office.Interop.Excel.XlListObjectSourceType.xlSrcRange, rng, Type.Missing, Microsoft.Office.Interop.Excel.XlYesNoGuess.xlYes);

            //Форматируем таблицу и применяем стиль
            tbl.TableStyle = "TableStyleMedium9";

            //шапка таблицы
            sheet.Cells[3, 1].Value = "Номер переговоров";
            sheet.Cells[3, 2].Value = "Абонент";
            sheet.Cells[3, 3].Value = "Город";
            sheet.Cells[3, 4].Value = "Дата";
            sheet.Cells[3, 5].Value = "Минуты";
            sheet.Cells[3, 6].Value = "Время"; 
            sheet.Cells[3, 7].Value = "Стоимость";

            sheet.Columns[1].ColumnWidth = 55;
            sheet.Columns[2].ColumnWidth = 25;
            sheet.Columns[3].ColumnWidth = 25;
            sheet.Columns[4].ColumnWidth = 30;
            sheet.Columns[5].ColumnWidth = 25;
            sheet.Columns[6].ColumnWidth = 25;
            sheet.Columns[7].ColumnWidth = 25;

            //i - общее количество строк в формируемой таблице
            int i = 4;


            foreach (GridViewRow row in GridView2.Rows)
            {
                sheet.Cells[i, 1].Value = Convert.ToString(row.Cells[0].Text);
                sheet.Cells[i, 2].Value = Convert.ToString(row.Cells[1].Text);
                sheet.Cells[i, 3].Value = Convert.ToString(row.Cells[2].Text);
                sheet.Cells[i, 4].NumberFormat = "DD:MM:YYYY";
                sheet.Cells[i, 4].Value = Convert.ToDateTime(row.Cells[3].Text).ToString("dd/MM/yyyy");
                sheet.Cells[i, 5].Value = Convert.ToString(row.Cells[4].Text);
                sheet.Cells[i, 6].Value = Convert.ToString(row.Cells[5].Text);
                sheet.Cells[i, 7].Value = Convert.ToString(row.Cells[6].Text);
                i++;
            }

            //шапку таблицы выделяем жирным шрифтом и устанавливаем выравнивание по центру
            rng.Font.Bold = true;
            rng.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;

            //отображаем сформированный документ
            app.Visible = true;
        }
    }
}