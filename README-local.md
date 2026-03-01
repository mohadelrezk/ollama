# Containarized vs. Local Installation of Ollama

<p>
https://alain-airom.medium.com/pros-and-cons-using-containerized-ollama-vs-local-setup-d9bdf225bbb5

<b>Containerized Ollama</b> offers advantages in isolation, dependency management, portability, reproducibility, and ease of management compared to a native installation. 

<b>While native installation</b> may offer slightly better performance or simpler setup for a single user, containerization is recommended for most development and production workflows, though a dual setup can provide flexibility. Read the full article on Medium.

https://docs.ollama.com/macos

`
$ curl -fsSL https://ollama.com/install.sh | sh

$ ollama pull mistral

-models location
$ ls ~/.ollama/models/blobs 

-exit cli chat
$ \bye