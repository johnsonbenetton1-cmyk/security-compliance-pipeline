  perimeter-validation:
    runs-on: ubuntu-latest
    steps:
    - name: Run TestSSL Perimeter Scan
      uses: drwetter/testssl.sh-action@v2.9.0-2
      with:
        target: 'https://yourstagingapp.com'
