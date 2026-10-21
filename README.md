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
Updated: 2026-10-21T10:54:58.550613+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.126 | 18 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.439 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.086 | 5155 |
| us-east-2 | 0.107 | 1704 |
| us-gov-east-1 | 0.115 | 1951 |
| us-gov-west-1 | 0.274 | 239 |
| us-west-1 | 0.210 | 4182 |
| us-west-2 | 0.271 | 195 |

