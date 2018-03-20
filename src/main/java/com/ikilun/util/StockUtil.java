package com.ikilun.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import com.csvreader.CsvReader;
import com.ikilun.http.HttpUtils;
import com.ikilun.model.Stock;
import com.ikilun.support.RequestCallback;

public class StockUtil {
	public static void main(String[] args) throws IOException {
		//readCvs("d:\\csv\\000001.csv");
		writeCvs();
	}
	public static void writeCvs() throws IOException {
		String start = "20160101";
		String end = "20180319";
		List<String> scodeList = FileUtils.readLines(new File("d:\\csv\\code1.txt"), "utf-8");
		for (String scode : scodeList) {
			if (StringUtils.length(scode) < 8) {
				continue;
			}
			final String code = scode.substring(scode.indexOf("(") + 1, scode.length() - 1);
			String fix = "0";
			if (code.startsWith("6")) {
				fix = "0";
			} else if (code.startsWith("0") || code.startsWith("3")) {
				fix = "1";
			} else {
				continue;
			}
			String url = "http://quotes.money.163.com/service/chddata.html?code=" + fix + code + "&start=" + start + "&end=" + end + "&fields=TCLOSE;HIGH;LOW;TOPEN;LCLOSE;CHG;PCHG;TURNOVER;VOTURNOVER;VATURNOVER;TCAP;MCAP";
			HttpUtils.getUrlAsInputStream(url, new HashMap<String, String>(), new RequestCallback() {
				@Override
				public boolean processResult(InputStream stream, Map<String, String> resHeader) {
					File file = new File("d:\\csv2\\" + code + ".txt");
					try {
						FileOutputStream output = new FileOutputStream(file);
						IOUtils.copy(stream, output);
						output.flush();
						output.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					return false;
				}
			}, "utf-8");
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	public static List<Stock> readCvs(String csvFilePath) {
		List<Stock> csvFileList = new ArrayList<Stock>();
		// 定义一个CSV路径  
		// 创建CSV读对象 例如:CsvReader(文件路径，分隔符，编码格式);  
		CsvReader reader;
		try {
			reader = new CsvReader(csvFilePath, ',', Charset.forName("GBK"));
			// 跳过表头 如果需要表头的话，这句可以忽略  
			reader.readHeaders();
			// 逐行读入除表头的数据  
			//日期	股票代码	名称	收盘价	最高价	最低价	开盘价	前收盘	涨跌额	涨跌幅	换手率	成交量	成交金额
			while (reader.readRecord()) {
				String[] v = reader.getValues();
				Stock stock = new Stock();
				String scode = v[1].replace("'", "");
				stock.setUkey(v[0]+"_"+scode);
				stock.setScode(scode);
				stock.setDate(DateUtil.parseDate(v[0], "yyyyMMdd"));
				stock.setSpj(Double.valueOf(v[3]));
				stock.setZgj(Double.valueOf(v[4]));
				stock.setZdj(Double.valueOf(v[5]));
				stock.setKpj(Double.valueOf(v[6]));
				stock.setQspj(Double.valueOf(v[7]));
				stock.setZde(Double.valueOf(v[8]));
				stock.setZdf(Double.valueOf(v[9]));
				stock.setHsl(Double.valueOf(v[10]));
				stock.setCjl(Double.valueOf(v[11]));
				stock.setCjje(Double.valueOf(v[12]));
				csvFileList.add(stock);
			}
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return csvFileList;
	}
}
