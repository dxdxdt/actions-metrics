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
Updated: 2026-05-13T19:43:36.777813+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.807 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.120 | 4632 |
| us-east-2 | 0.112 | 1591 |
| us-gov-east-1 | 0.108 | 1688 |
| us-gov-west-1 | 0.231 | 195 |
| us-west-1 | 0.183 | 3560 |
| us-west-2 | 0.235 | 158 |

