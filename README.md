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
Updated: 2026-07-17T22:41:24.153492+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.892 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.151 | 4877 |
| us-east-2 | 0.128 | 1657 |
| us-gov-east-1 | 0.103 | 1765 |
| us-gov-west-1 | 0.211 | 203 |
| us-west-1 | 0.156 | 3793 |
| us-west-2 | 0.211 | 166 |

