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
Updated: 2026-04-26T11:34:42.962665+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.722 |  |
| ap-east-2 | 0.658 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.169 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.143 | 4566 |
| us-east-2 | 0.119 | 1533 |
| us-gov-east-1 | 0.126 | 1665 |
| us-gov-west-1 | 0.212 | 194 |
| us-west-1 | 0.159 | 3484 |
| us-west-2 | 0.214 | 157 |

