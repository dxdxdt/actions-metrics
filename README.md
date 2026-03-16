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
Updated: 2026-03-16T11:41:37.348175+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.695 |  |
| ap-northeast-3 | 0.606 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.781 |  |
| mx-central-1 | 0.282 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.112 | 4289 |
| us-east-2 | 0.125 | 1429 |
| us-gov-east-1 | 0.134 | 1577 |
| us-gov-west-1 | 0.257 | 185 |
| us-west-1 | 0.208 | 3241 |
| us-west-2 | 0.248 | 148 |

