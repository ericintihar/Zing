﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Capstone.Web.Models;
using System.Data.SqlClient;
using Capstone.Web.Models.ViewModels;
using Dapper; 

namespace Capstone.Web.DAL
{
    public class RecipeIngredientSqlDAL : IRecipeIngredientDAL
    {
        private readonly string connectionString;
        private const string SqlGetUserRecipeIngredient = @"select * from recipe_ingredient where recipe_id=@recipe_id;";

        public RecipeIngredientSqlDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }


        public List<RecipeIngredient> GetRecipeIngredients(int recipeId)
        {
            List<RecipeIngredient> recipeIngredient = new List<RecipeIngredient>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(SqlGetUserRecipeIngredient, conn);
                    cmd.Parameters.AddWithValue("@recipe_id", recipeId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        RecipeIngredient r = new RecipeIngredient();
                        r.IngredientName = Convert.ToString(reader["ingredient_name"]);
                        r.Measurement = Convert.ToString(reader["measurement"]);
                        r.Quantity = Convert.ToInt32(reader["quantity"]);

                        recipeIngredient.Add(r);

                    }

                }
                return recipeIngredient;
            }
            catch (SqlException ex)
            {
                throw;
            }
        }

        public void SaveRecipeIngredients(List<RecipeIngredient> recipeIngredients)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    foreach (var recipeIngredient in recipeIngredients)
                    {
                        
                     recipeIngredient.Recipe_id = conn.QueryFirst<int>("INSERT INTO recipe_ingredient VALUES (@nameValue, @measurementValue, @quantityValue); SELECT CAST(SCOPE_IDENTITY() as int);",
                        new { nameValue = recipeIngredient.IngredientName, measurementValue = recipeIngredient.Measurement, quantityValue = recipeIngredient.Quantity });

                    }
                }
            }
            catch (SqlException ex)
            {
                throw;
            }
        }
    }
}