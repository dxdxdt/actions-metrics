# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-03-18T16:03:04.855795+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.890 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.758 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.752 |  |
| ap-northeast-3 | 0.661 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.884 |  |
| ap-southeast-2 | 0.791 |  |
| ap-southeast-3 | 0.949 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.319 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.569 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.737 |  |
| mx-central-1 | 0.271 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.059 | 4304 |
| us-east-2 | 0.083 | 1433 |
| us-gov-east-1 | 0.107 | 1586 |
| us-gov-west-1 | 0.302 | 189 |
| us-west-1 | 0.262 | 3250 |
| us-west-2 | 0.303 | 148 |

