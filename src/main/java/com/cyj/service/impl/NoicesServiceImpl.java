package com.cyj.service.impl;

import com.cyj.dao.NoicesMapper;
import com.cyj.pojo.Noices;
import com.cyj.service.NoicesService;
import com.cyj.utils.excel.ExcelBean;
import com.cyj.utils.excel.ExcelUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.*;

/**
 * Created by amini on 2018/8/4.
 */
public class NoicesServiceImpl implements NoicesService {
    @Autowired
    NoicesMapper noicesMapper;
    @Override
    public List<Noices> selectNoicesList() throws Exception {
        return noicesMapper.selectNoicesList();
    }

    @Override
    public void updateNoicesStatus(Integer noicesId, Integer noicesStatus) throws Exception {
        noicesMapper.updateNoicesStatus(noicesId,noicesStatus);
    }

    @Override
    public List<Noices> getNoicesListByStatus(Integer noicesStatus) throws Exception {
        return noicesMapper.getNoicesListByStatus(noicesStatus);
    }

    @Override
    public void insertNoices(Noices noices) throws Exception {
        noicesMapper.insert(noices);
    }

    @Override
    public void insertExcelInfo(InputStream in, MultipartFile file, int noiceStatus) throws Exception {
        List<List<Object>> listob= ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<Noices> noicesList=new ArrayList<>();
        Noices noices=null;
        //遍历listob数据，把数据放到List中
        if (listob.size()<1){
            return;
        }
        for (int i=0;i<listob.size();i++){
            List<Object> ob=listob.get(i);
            noices=new Noices();
            noices.setNoiceContent(String.valueOf(ob.get(0)));
            noices.setNoiceCreateTime(new Date());
            noices.setNoiceStatus(noiceStatus);
            noicesList.add(noices);
        }
        //批量插入
        noicesMapper.insertInfoBatch(noicesList);
    }

    @Override
    public XSSFWorkbook exportExcelInfo() throws Exception {
        List<Noices> noicesList=noicesMapper.selectNoicesList();
        List<ExcelBean> excel=new ArrayList<>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("ID","noiceId",0));
        excel.add(new ExcelBean("内容","noiceContent",0));
        excel.add(new ExcelBean("添加时间","noiceCreateTime",0));
        excel.add(new ExcelBean("状态","noiceStatus",0));
        map.put(0,excel);
        String sheetName="通知列表"+System.currentTimeMillis();
        //调用ExcelUtil的方法
        xssfWorkbook=ExcelUtil.createExcelFile(Noices.class,noicesList,map,sheetName);
        return xssfWorkbook;
    }
}
