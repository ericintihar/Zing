﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Capstone.Web.Models.ViewModels
{
    public class MealRecipeViewModel
    {
        public int UserId { get; set; }
        public int RecipeId { get; set;}
        public List<string> MealType { get; set; }

        public static List<SelectListItem> MealTypes { get; } = new List<SelectListItem>()
        {
            new SelectListItem() {Text="Entree" , Value="Entree"},
            new SelectListItem() {Text="Sidedish" , Value="Sidedish"},
            new SelectListItem() {Text="Snack" , Value="Snack"},
            new SelectListItem() {Text="Appetizer" , Value="Appetizer"},
            new SelectListItem() {Text="Dessert" , Value="Dessert"},

        };

        public int MealId { get; set; }
        public string MealName { get; set; }
        public string RecipeName { get; set; }
        public List<Recipe> ListOfRecipies { get; set; }
        public List<string> RecipeNames { get; set; }
        public List<int> RecipeIds { get; set; }
        public List<SelectListItem> RecipeList { get; set; } = new List<SelectListItem>();
        public List<string> RecipeIdMealType { get; set; }
        public string MealImageName { get; set; }



    }
}