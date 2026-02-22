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
Updated: 2026-02-22T14:20:07.381969+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.007 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.218 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.842 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.173 | 4161 |
| us-east-2 | 0.151 | 1371 |
| us-gov-east-1 | 0.152 | 1500 |
| us-gov-west-1 | 0.180 | 160 |
| us-west-1 | 0.153 | 3098 |
| us-west-2 | 0.185 | 129 |

