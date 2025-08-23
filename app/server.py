from http.server import BaseHTTPRequestHandler, HTTPServer
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        msg = b"Hello from Jenkins/EKS Lab!\\n"
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(msg)))
        self.end_headers()
        self.wfile.write(msg)

if __name__ == "__main__":
    HTTPServer(("", 8080), Handler).serve_forever()
