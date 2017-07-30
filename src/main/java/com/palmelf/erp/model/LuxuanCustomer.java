package com.palmelf.erp.model;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "LUXUANCUSTOMER", catalog = "ERP")
@DynamicUpdate(true)
@DynamicInsert(true)
public class LuxuanCustomer implements java.io.Serializable
{
	private static final long serialVersionUID = -2821343605850547602L;
	private Integer customerId;
	private String baby_name;
	private String parent_name;
	private String baby_sex;
	private String myid;
	private String status;
	private Integer creater;
	private Integer modifiyer;
	private String tel;
	private Integer member_point;

	// Constructors

	/** default constructor */
	public LuxuanCustomer()
	{
	}

	/** minimal constructor */
	public LuxuanCustomer(String baby_name, String status)
	{
		this.baby_name = baby_name;
		this.status = status;
	}

	/** full constructor */
	public LuxuanCustomer(String baby_name, String parent_name, String baby_sex, String myid, String status,
						  Integer creater, Integer modifiyer, String tel, Integer member_point)
	{
		this.baby_name = baby_name;
		this.parent_name = parent_name;
		this.baby_sex = baby_sex;
		this.myid = myid;
		this.status = status;
		this.creater = creater;
		this.modifiyer = modifiyer;
		this.tel = tel;
		this.member_point = member_point;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "CUSTOMER_ID", unique = true, nullable = false)
	public Integer getCustomerId()
	{
		return this.customerId;
	}

	public void setCustomerId(Integer customerId )
	{
		this.customerId = customerId;
	}

	@Column(name = "BABY_NAME")
	public String getBaby_name(){
		return this.baby_name;
	}

	public void setBaby_name(String baby_name){
		this.baby_name = baby_name ;
	}

	@Column(name = "PARENT_NAME")
	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name){
		this.parent_name = parent_name;
	}

	@Column(name = "BABY_SEX")
	public String getBaby_sex(){
		return this.baby_sex;
	}

	public void setBaby_sex(String baby_sex){
		this.baby_sex = baby_sex;
	}

	@Column(name = "MEMBER_POINTS", nullable = false)
	public Integer getMember_point(){
		return this.member_point;
	}

	public void setMember_point(Integer member_point){
		this.member_point = member_point;
	}

	@Column(name = "MYID", length = 55)
	public String getMyid()
	{
		return this.myid;
	}

	public void setMyid(String myid )
	{
		this.myid = myid;
	}

	@Column(name = "STATUS", nullable = false, length = 1)
	public String getStatus()
	{
		return this.status;
	}

	public void setStatus(String status )
	{
		this.status = status;
	}

	@Column(name = "CREATER")
	public Integer getCreater()
	{
		return this.creater;
	}

	public void setCreater(Integer creater )
	{
		this.creater = creater;
	}

	@Column(name = "MODIFIYER")
	public Integer getModifiyer()
	{
		return this.modifiyer;
	}

	public void setModifiyer(Integer modifiyer )
	{
		this.modifiyer = modifiyer;
	}

	@Column(name = "TEL", length = 55)
	public String getTel()
	{
		return this.tel;
	}

	public void setTel(String tel )
	{
		this.tel = tel;
	}

}