using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel
{
    
    class Accion
    {

    private ConexionBD  baseDatos;
    private  SqlCommand cmd;
    // insert("user","(nombre,funcionalidades,estado)"," txtname + "','" + txtFuncionalidades + "','" + txtEstado + "','" ")
    private  SqlConnection con = new SqlConnection(new ConexionBD().getPath());
    public void insert(String tabla,String campos,String txt){
    try
    {
        SqlConnection con = new SqlConnection(baseDatos.getPath());
        baseDatos.conectarBase();
        baseDatos.abrirBase();
        String query = "insert into" + tabla + campos + "values('" + txt + "')";
        SqlDataAdapter adapter = new SqlDataAdapter(query, con);
        adapter.SelectCommand.ExecuteNonQuery();
        MessageBox.Show("Se inserto correctamente los campos" + campos + "en"  + tabla, "OK", MessageBoxButtons.OK,MessageBoxIcon.Information);
    }
    catch (Exception e)
        {
        MessageBox.Show("Error al querer insertar en " + tabla, "ERROR", MessageBoxButtons.OK,MessageBoxIcon.Error);
        throw new Exception();
        }

    baseDatos.cerrarBase();
    }

    public void select(String tabla, String campos)
    {
        try
        {
            baseDatos.conectarBase();
            baseDatos.abrirBase();
            //select("user","nombre,edad,sexo,dni")
            String query = "select " + campos + "from " + tabla;
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            adapter.SelectCommand.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            MessageBox.Show("Error al querer mostrar la tabla " + tabla, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            throw new Exception();
        }
    }

   public void selectConCondicion(String campos,String tabla,String condicion)
    {
        try{
        baseDatos.conectarBase();
        baseDatos.abrirBase();
        //select("user","nombre,edad,sexo,dni","nombre LIKE %M__%")
        String query = "select " + campos + "from " + tabla + "where " + condicion;
        SqlDataAdapter adapter = new SqlDataAdapter(query, con);
        adapter.SelectCommand.ExecuteNonQuery();
    }
    catch (Exception e)
        {
        MessageBox.Show("Error al querer mostrar la tabla " + tabla, "ERROR", MessageBoxButtons.OK,MessageBoxIcon.Error);
        throw new Exception();
        }


    }
   public void update(String tabla, String campo, String nuevoCampo)
   {
       try
       {
           baseDatos.conectarBase();
           baseDatos.abrirBase();
           //update("user","nombre","Ricardo")
           String query = "update " + tabla + " set " + campo +"=" + nuevoCampo;
           SqlDataAdapter adapter = new SqlDataAdapter(query, con);
           adapter.SelectCommand.ExecuteNonQuery();
       }
       catch (Exception e)
       {
           MessageBox.Show("Error al querer mostrar la tabla " + tabla, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
           throw new Exception();
       }
   }
    

    }
}
