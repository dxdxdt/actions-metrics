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
Updated: 2026-06-03T13:10:00.478706+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.812 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.828 |  |
| ap-southeast-7 | 0.988 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.422 |  |
| eu-west-1 | 0.302 |  |
| eu-west-2 | 0.337 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.540 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.057 | 4716 |
| us-east-2 | 0.100 | 1621 |
| us-gov-east-1 | 0.097 | 1708 |
| us-gov-west-1 | 0.321 | 196 |
| us-west-1 | 0.270 | 3630 |
| us-west-2 | 0.331 | 162 |

