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
Updated: 2025-10-08T13:24:39.843746+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.049 |  |
| ap-east-1 | 0.698 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.609 |  |
| ap-south-1 | 0.979 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.644 |  |
| ca-central-1 | 0.228 | 15 |
| eu-central-1 | 0.546 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.575 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.530 |  |
| me-south-1 | 0.857 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.194 | 3241 |
| us-east-2 | 0.162 | 872 |
| us-gov-east-1 | 0.167 | 1061 |
| us-gov-west-1 | 0.159 | 50 |
| us-west-1 | 0.129 | 2181 |
| us-west-2 | 0.162 | 20 |

