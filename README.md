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
Updated: 2026-03-11T12:41:12.595246+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.638 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.624 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.944 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.719 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.447 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.840 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.171 | 4258 |
| us-east-2 | 0.128 | 1418 |
| us-gov-east-1 | 0.122 | 1561 |
| us-gov-west-1 | 0.174 | 178 |
| us-west-1 | 0.177 | 3209 |
| us-west-2 | 0.171 | 144 |

