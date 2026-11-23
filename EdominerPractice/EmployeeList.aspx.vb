Imports System
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Imports System.Web.UI
Imports System.Web.Script
Imports System.ComponentModel

Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim connstr As String = ConfigurationManager.ConnectionStrings("EdominerPracticeDB").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                BindEmployees()
            End If
        Catch ex As Exception
            lblError.Text = ex.Message
        End Try
    End Sub

    Private Sub BindEmployees()
        Try
            Dim con As New SqlConnection(connstr)
            Dim cmd As New SqlCommand("Select * from Employees", con)
            Dim sda As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            sda.Fill(dt)
            gvEmployees.DataSource = dt
            gvEmployees.DataBind()
        Catch ex As Exception
            LogError(ex)
            lblError.Text = "Unable to load employee details. Please try again."
        End Try
    End Sub

    Private Sub LogError(ex As Exception)
        System.Diagnostics.Trace.TraceError(ex.ToString())
    End Sub

    Protected Sub gvEmployees_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Try
            Using con As New SqlConnection(connstr)
                If e.CommandName = "ViewDetails" Then
                    Dim employeeid As Integer = Convert.ToInt32(e.CommandArgument)
                    Dim sql As String = "Select EmployeeName, Department, Designation, Salary, JoinDate, Email, Phone, Address from Employees where EmployeeID = @employeeid"
                    Using cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@employeeid", employeeid)
                        con.Open()
                        Using reader As SqlDataReader = cmd.ExecuteReader()
                            If reader.Read() Then
                                txtEmployeeName.Text = reader("EmployeeName").ToString()
                                txtDepartment.Text = reader("Department").ToString()
                                txtDesignation.Text = reader("Designation").ToString()
                                txtSalary.Text = Convert.ToDecimal(reader("Salary")).ToString("0.00")
                                txtJoinDate.Text = Convert.ToDateTime(reader("JoinDate")).ToString("yyyy-MM-dd")
                                txtEmail.Text = reader("Email").ToString()
                                txtPhone.Text = reader("Phone").ToString()
                                txtAddress.Text = reader("Address").ToString()


                                txtEmployeeName.ReadOnly = True
                                txtDepartment.ReadOnly = True
                                txtDesignation.ReadOnly = True
                                txtSalary.ReadOnly = True
                                txtJoinDate.ReadOnly = True
                                txtEmail.ReadOnly = True
                                txtPhone.ReadOnly = True
                                txtAddress.ReadOnly = True
                                btnSaveChanges.Visible = False
                            Else
                                lblError.Text = "Employee not found."
                                Return
                            End If
                        End Using
                    End Using
                    Dim modalScript As String = "window.addEventListener('load', function() {" &
                    "var modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('employeemodal'));" & "modal.show();" & "});"
                    ClientScript.RegisterStartupScript(
                    Me.GetType(),
                        "OpenEmployeeModal",
                        modalScript,
                        True
                    )
                ElseIf e.CommandName = "EditDetails" Then
                    Dim employeeid As Integer = Convert.ToInt32(e.CommandArgument)
                    hfEmployeeID.Value = employeeid.ToString() 'To get the EmployeeID to the Hidden Field 
                    Dim sql As String = "Select EmployeeName, Department, Designation, Salary, JoinDate, Email, Phone, Address from Employees where EmployeeID = @employeeid"
                    Using cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@employeeid", employeeid)
                        con.Open()
                        Using reader As SqlDataReader = cmd.ExecuteReader()
                            If reader.Read() Then
                                txtEmployeeName.Text = reader("EmployeeName").ToString()
                                txtDepartment.Text = reader("Department").ToString()
                                txtDesignation.Text = reader("Designation").ToString()
                                txtSalary.Text = Convert.ToDecimal(reader("Salary")).ToString("0.00")
                                txtJoinDate.Text = Convert.ToDateTime(reader("JoinDate")).ToString("yyyy-MM-dd")
                                txtEmail.Text = reader("Email").ToString()
                                txtPhone.Text = reader("Phone").ToString()
                                txtAddress.Text = reader("Address").ToString()



                                'cmd.Parameters.AddWithValue("@EmployeeName", txtEmployeeName.Text)
                                'cmd.Parameters.AddWithValue("@Department", txtDepartment.Text)
                                'cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text)
                                'cmd.Parameters.AddWithValue("@Salary", txtSalary.Text)
                                'cmd.Parameters.AddWithValue("@JoinDate", txtJoinDate.Text)
                                'cmd.Parameters.AddWithValue("@Email", txtEmail.Text)
                                'cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
                                'cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                                'cmd.Parameters.AddWithValue("@employeeid", employeeid)
                                'con.Open()
                                'cmd.ExecuteNonQuery()

                                txtEmployeeName.ReadOnly = False
                                txtDepartment.ReadOnly = False
                                txtDesignation.ReadOnly = False
                                txtSalary.ReadOnly = False
                                txtJoinDate.ReadOnly = False
                                txtEmail.ReadOnly = False
                                txtPhone.ReadOnly = False
                                txtAddress.ReadOnly = False
                                btnSaveChanges.Visible = True
                            Else
                                lblError.Text = "Employee not found."
                                Return
                            End If
                            Dim modalScript As String = "window.addEventListener('load', function() {" &
                                "var modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('employeemodal'));" & "modal.show();" & "});"
                            ClientScript.RegisterStartupScript(
                            Me.GetType(),
                            "OpenEmployeeModal",
                            modalScript,
                            True
                            )

                        End Using
                    End Using
                ElseIf e.CommandName = "DeleteDetails" Then
                    Dim employeeid As Integer

                    If Not Integer.TryParse(Convert.ToString(e.CommandArgument), employeeid) OrElse employeeid <= 0 Then
                        lblError.Text = "Invalid EmployeeID"
                        Return
                    End If
                    Dim sql As String = "Delete from Employees where EmployeeID = @employeeid"
                    Using cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@employeeid", employeeid)
                        con.Open()
                        Dim RowsAffected As Integer = cmd.ExecuteNonQuery()
                        If RowsAffected > 0 Then
                            BindEmployees()
                            lblError.CssClass = "text-success"
                            lblError.Text = "Employee deleted successfully."
                        Else
                            lblError.Text = "Employee not found or already deleted."
                        End If

                        lblError.Text = "Selected Employee ID: " & employeeid.ToString()
                    End Using
                End If
            End Using
        Catch ex As Exception
            lblError.Text = ex.Message
        End Try

    End Sub

    Protected Sub AddNewEmployee_Click(sender As Object, e As EventArgs)
        Try
            Response.Redirect("~/AddEmployee.aspx")
        Catch ex As Exception
            lblError.Text = "Unexpected Error Caught..."
        End Try

    End Sub

    Protected Sub btnSaveChanges_Click(sender As Object, e As EventArgs)
        Try
            Dim employeeid As Integer

            If Not Integer.TryParse(hfEmployeeID.Value, employeeid) OrElse employeeid <= 0 Then
                lblError.Text = "Invalid EmployeeID"
                Return
            End If
            Dim con As New SqlConnection(connstr)
            Dim sql As String = "Update Employees set EmployeeName=@EmployeeName, Department=@Department, Designation=@Designation, Salary=@Salary, JoinDate=@JoinDate, Email=@Email, Phone=@Phone, Address=@Address where EmployeeID=@employeeid"
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@EmployeeName", txtEmployeeName.Text)
                cmd.Parameters.AddWithValue("@Department", txtDepartment.Text)
                cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text)
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text)
                cmd.Parameters.AddWithValue("@JoinDate", txtJoinDate.Text)
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text)
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                cmd.Parameters.AddWithValue("@employeeid", employeeid)
                Dim salary As Decimal
                If Not Decimal.TryParse(txtSalary.Text, salary) OrElse salary < 0D Then
                    lblError.Text = "Invalid salary."
                    Return
                End If

                Dim joinDate As DateTime
                If Not DateTime.TryParse(txtJoinDate.Text, joinDate) Then
                    lblError.Text = "Invalid joining date."
                    Return
                End If
                con.Open()
                cmd.ExecuteNonQuery()
                BindEmployees()
            End Using
            lblError.Text = "Selected Employee ID: " & employeeid.ToString()
        Catch ex As Exception
            LogError(ex)
            lblError.Text = ex.Message
            lblError.Text = "Couldn't able to Update Data..."
        End Try

    End Sub

    'Protected Sub btnOpenModal_Click(sender As Object, e As EventArgs)
    '    lblEmployeeName.Text = 
    'End Sub
End Class