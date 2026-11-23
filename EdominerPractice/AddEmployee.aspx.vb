Imports System.Data.SqlClient

Public Class WebForm2
    Inherits System.Web.UI.Page
    Dim connstr As String = ConfigurationManager.ConnectionStrings("EdominerPracticeDB").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnAddEmployee_Click(sender As Object, e As EventArgs)
        Try
            Using con As New SqlConnection(connstr)
                Dim sql As String =
                    "INSERT INTO Employees " &
                    "(EmployeeName, Department, Designation, Salary, JoinDate, Email, Phone, Address) " &
                    "VALUES (@EmployeeName, @Department, @Designation, @Salary, @JoinDate, @Email, @Phone, @Address)"


                Dim salary As Decimal
                If Not Decimal.TryParse(txtSalary.Text, salary) OrElse salary < 0D Then
                    lblError.Text = "Please enter a valid salary..."
                    Return
                End If
                Dim joinDate As DateTime
                If Not DateTime.TryParse(txtJoinDate.Text, joinDate) Then
                    lblError.Text = "Please enter a valid join date..."
                    Return
                End If


                Using cmd As New SqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@EmployeeName", txtEmployeeName.Text)
                    cmd.Parameters.AddWithValue("@Department", txtDepartment.Text)
                    cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text)
                    cmd.Parameters.AddWithValue("@Salary", salary)
                    cmd.Parameters.AddWithValue("@JoinDate", joinDate)
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text)
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text)

                    con.Open()
                    Dim rowAffected As Integer = cmd.ExecuteNonQuery()
                    If rowAffected > 0 Then
                        lblError.CssClass = "text-success"
                        lblError.Text = "Employee added successfully."
                    Else
                        lblError.Text = "Failed to add employee."
                    End If
                End Using
            End Using

        Catch ex As Exception
            lblError.Text = "Unable to save employee."
        End Try
    End Sub

    Protected Sub btnReturnBacktoEmpList_Click(sender As Object, e As EventArgs)
        Server.Transfer("~/EmployeeList.aspx")
    End Sub
End Class