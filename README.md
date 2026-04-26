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
Updated: 2026-04-26T18:40:45.819406+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.101 | 4568 |
| us-east-2 | 0.129 | 1535 |
| us-gov-east-1 | 0.119 | 1665 |
| us-gov-west-1 | 0.274 | 194 |
| us-west-1 | 0.221 | 3486 |
| us-west-2 | 0.271 | 157 |

