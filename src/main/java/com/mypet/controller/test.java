package com.mypet.controller;

public class test {
	public static void main(String[] args) {
		short a=(short)0x1234;
		short b=(short)((a<<8)&0xFF00);
		short c=(short)((a>>8)&0x00FF);
		short d=(short)(b|c);
		System.out.format("%x", d);
	}
}
