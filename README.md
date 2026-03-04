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
Updated: 2026-03-04T19:33:36.869566+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.634 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.443 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.071 | 4220 |
| us-east-2 | 0.109 | 1397 |
| us-gov-east-1 | 0.103 | 1530 |
| us-gov-west-1 | 0.296 | 170 |
| us-west-1 | 0.236 | 3172 |
| us-west-2 | 0.302 | 140 |

