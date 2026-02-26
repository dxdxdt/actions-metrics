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
Updated: 2026-02-26T15:46:12.059200+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.900 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.779 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.410 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.068 | 4188 |
| us-east-2 | 0.081 | 1381 |
| us-gov-east-1 | 0.090 | 1512 |
| us-gov-west-1 | 0.279 | 162 |
| us-west-1 | 0.245 | 3123 |
| us-west-2 | 0.278 | 132 |

