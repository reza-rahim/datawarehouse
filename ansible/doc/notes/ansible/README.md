

### Debugging ansible printout from the echo
```

- name: Initialize Superset database
  shell: |
        echo "Decrypted SECRET_KEY is: $SUPERSET_SECRET_KEY"
  register: init_output

- name: Show decrypted secret key from eval
  debug:
    var: init_output.stdout

```
