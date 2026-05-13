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
Updated: 2026-05-13T17:10:27.723938+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.153 | 4632 |
| us-east-2 | 0.160 | 1591 |
| us-gov-east-1 | 0.157 | 1687 |
| us-gov-west-1 | 0.201 | 195 |
| us-west-1 | 0.146 | 3560 |
| us-west-2 | 0.201 | 158 |

