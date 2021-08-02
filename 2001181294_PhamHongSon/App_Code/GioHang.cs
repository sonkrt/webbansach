using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GioHang
/// </summary>
public class GioHang
{
    private int ms;

    public int Ms
    {
        get { return ms; }
        set { ms = value; }
    }
    private string tenSach;

    public string TenSach
    {
        get { return tenSach; }
        set { tenSach = value; }
    }
    private int gia;

    public int Gia
    {
        get { return gia; }
        set { gia = value; }
    }
    private int soLuong;

    public int SoLuong
    {
        get { return soLuong; }
        set { soLuong = value; }
    }
    private int thanhTien;

    public int ThanhTien
    {
        get { return soLuong * gia; } 
    }
	public GioHang()
    {
        
	}
}