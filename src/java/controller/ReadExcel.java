/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Reading;
import model.Test;
import dao.TestDAO;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 *
 * @author Asus
 */
public class ReadExcel {
    public ReadExcel() {
    }

    private static double getNumericCellValue(Row row, int index) {
        if (row == null) {
            return 0; // Kiểm tra hàng null
        }
        Cell cell = row.getCell(index);
        if (cell == null) {
            return 0; // Kiểm tra ô null
        }
        // Kiểm tra kiểu dữ liệu của ô
        if (cell.getCellType() == CellType.NUMERIC) {
            return cell.getNumericCellValue(); // Nếu là số, trả về giá trị
        } else {
            return 0; // Nếu không phải số, trả về 0
        }
    }

    // Trả về "null" nếu ô bị null
    private static String getCellValue(Row row, int index) {
        if (row == null) {
            return "null"; // Hàng null
        }
        Cell cell = (Cell) row.getCell(index);
        if (cell == null) {
            return "null"; // Ô null
        }
        return cell.getStringCellValue();
    }

    private static boolean isRowEmpty(Row row) {
        if (row == null) {
            return true;
        }
        for (int i = 0; i < row.getLastCellNum(); i++) {
            Cell cell = (Cell) row.getCell(i);
            if (cell != null && !cell.toString().trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }

    // Trả về 0 nếu ô trống
    public static List<Reading> getReading(String filePath) {
        List<Reading> questionList = new ArrayList<>();

        try (FileInputStream fis = new FileInputStream(new File(filePath)); Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = (Sheet) workbook.getSheetAt(0);
            boolean firstRow = true;

            for (Row row : sheet) {
                if (firstRow) { // Bỏ qua tiêu đề
                    firstRow = false;
                    continue;
                }

                if (isRowEmpty(row)) { // Nếu hàng trống, dừng việc đọc file
                    System.out.println("Encountered empty row. Stopping file read.");
                    break;
                }

                String part = getCellValue(row, 0);
                int num = (int) getNumericCellValue(row, 1);
                String paragraph = getCellValue(row, 2);
                String question = getCellValue(row, 3);
                String option1 = getCellValue(row, 4);
                String option2 = getCellValue(row, 5);
                String option3 = getCellValue(row, 6);
                String option4 = getCellValue(row, 7);
                String correctAnswer = getCellValue(row, 8);

                questionList.add(new Reading(part, num, paragraph, question, option1, option2, option3, option4, correctAnswer));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return questionList;
    }

//    public static ArrayList<Listenning> getListenning(String filePath) {
//        ArrayList<Listenning> listen = new ArrayList<>();
//
//        try (FileInputStream fis = new FileInputStream(new File(filePath)); Workbook workbook = new XSSFWorkbook(fis)) {
//            Sheet sheet = workbook.getSheetAt(0);
//            boolean firstRow = true;
//
//            for (Row row : sheet) {
//                if (firstRow) { // Bỏ qua tiêu đề
//                    firstRow = false;
//                    continue;
//                }
//
//                if (isRowEmpty(row)) { // Nếu hàng trống, dừng việc đọc file
//                    System.out.println("Encountered empty row. Stopping file read.");
//                    break;
//                }
//
//                String part =  getCellValue(row, 0);
//                int num = (int) getNumericCellValue(row, 1);
//                String img = getCellValue(row, 2);
//                String audio = getCellValue(row, 3);
//                String question = getCellValue(row, 4);
//                String option1 = getCellValue(row, 5);
//                String option2 = getCellValue(row, 6);
//                String option3 = getCellValue(row, 7);
//                String option4 = getCellValue(row, 8);
//                String correctAnswer = getCellValue(row, 9);
//
//                listen.add(new Listenning(part, num,  img, audio, question, option1, option2, option3, option4, correctAnswer));
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return listen;
//    }
       
     public static void main(String[] args) {
        
        String filePath = "D:\\GITPRJ\\PRJ301_LearningApp\\web\\WEB-INF\\Excel\\Assignment\\Reading\\Starter_TOEIC_ReadingUnit1.xlsx";
        System.out.println(filePath);
        List<Reading> questions = getReading(filePath);

        for (Reading question : questions) {
            System.out.println(question);
        }
    }
}
