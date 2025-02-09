import os 
from dotenv import load_dotenv
from supabase import create_client

load_dotenv()

url = os.getenv('URL')
key = os.getenv('KEY')

supabase = create_client(url, key)

def add_mobile(mobile):
    try:
        response = supabase.table('otpauth').insert({'mobile': mobile}).execute()
        print("mobile added/updated successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")
    