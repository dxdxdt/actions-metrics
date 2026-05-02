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
Updated: 2026-05-02T07:22:03.160677+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.846 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.149 | 4583 |
| us-east-2 | 0.131 | 1555 |
| us-gov-east-1 | 0.129 | 1670 |
| us-gov-west-1 | 0.224 | 194 |
| us-west-1 | 0.168 | 3515 |
| us-west-2 | 0.223 | 157 |

