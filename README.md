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
Updated: 2025-01-31T17:10:05.614291+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.730 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.647 |  |
| ap-south-1 | 0.896 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.702 |  |
| ca-central-1 | 0.205 | 4 |
| eu-central-1 | 0.492 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.515 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.456 |  |
| me-south-1 | 0.828 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.150 | 851 |
| us-east-2 | 0.169 | 192 |
| us-gov-east-1 | 0.180 | 201 |
| us-gov-west-1 | 0.236 | 1 |
| us-west-1 | 0.178 | 561 |
| us-west-2 | 0.233 |  |

