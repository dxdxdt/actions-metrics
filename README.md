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
Updated: 2026-06-06T00:01:09.013562+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.826 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.085 | 4725 |
| us-east-2 | 0.103 | 1625 |
| us-gov-east-1 | 0.108 | 1709 |
| us-gov-west-1 | 0.289 | 196 |
| us-west-1 | 0.233 | 3636 |
| us-west-2 | 0.292 | 162 |

