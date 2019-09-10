package other;

import java.io.File;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ForTest {

	public static void main(String[] args) {

		
//		try {
//			Workbook wb = Workbook.getWorkbook(new File("C:\\Project\\workspace\\jspExercise\\src\\main\\webapp\\resources\\template.xls"));
//			WritableWorkbook wwb = Workbook.createWorkbook(new File("C:\\Project\\workspace\\jspExercise\\src\\main\\webapp\\resources\\output_test.xls"), wb);
//			WritableSheet sheet = wwb.getSheet(0);
//			WritableFont writeFont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD);
//			WritableCellFormat writeFormat = new WritableCellFormat(writeFont);
//			writeFormat.setAlignment(Alignment.CENTRE);
//			writeFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
//			writeFormat.setBorder(Border.LEFT, BorderLineStyle.THIN, Colour.BLACK);
//			writeFormat.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.BLACK);
//			writeFormat.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.BLACK);
//			writeFormat.setBorder(Border.BOTTOM, BorderLineStyle.THIN, Colour.BLACK);
//			for(int i=4;i<=10;i++) {
//				for(int j=3;j<=4;j++) {
//					if(j%2==1) {
//						String x = "商品"+(i-3);
//						Label label = new Label(i,j,x,writeFormat);
//						sheet.addCell(label);
//					}else {
//						int price = 50;
//						Label label = new Label(i,j,String.valueOf(price*2*i),writeFormat);
//						sheet.addCell(label);
//					}
//					
//				}
//			}
//			
//			
//			wwb.write();
//			wwb.close();
//			wb.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		System.out.println("template.xls".toString());
		
	}

}
