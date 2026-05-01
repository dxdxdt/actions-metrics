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
Updated: 2026-05-01T14:18:41.724905+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.586 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.091 | 4580 |
| us-east-2 | 0.116 | 1553 |
| us-gov-east-1 | 0.128 | 1669 |
| us-gov-west-1 | 0.295 | 194 |
| us-west-1 | 0.245 | 3510 |
| us-west-2 | 0.311 | 157 |

