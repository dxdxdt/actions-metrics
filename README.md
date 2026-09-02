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
Updated: 2026-09-02T14:51:10.718093+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.060 |  |
| ap-east-1 | 0.629 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.479 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.712 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.764 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.727 |  |
| ap-southeast-6 | 0.659 |  |
| ap-southeast-7 | 0.808 |  |
| ca-central-1 | 0.281 | 18 |
| ca-west-1 | 0.167 |  |
| eu-central-1 | 0.561 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.613 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.606 |  |
| eu-west-1 | 0.483 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.541 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.688 |  |
| us-east-1 | 0.228 | 5078 |
| us-east-2 | 0.224 | 1685 |
| us-gov-east-1 | 0.215 | 1892 |
| us-gov-west-1 | 0.119 | 230 |
| us-west-1 | 0.129 | 4075 |
| us-west-2 | 0.116 | 191 |

