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
Updated: 2026-05-10T15:44:40.666289+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.865 |  |
| ap-southeast-6 | 0.848 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.389 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.075 | 4621 |
| us-east-2 | 0.067 | 1584 |
| us-gov-east-1 | 0.076 | 1685 |
| us-gov-west-1 | 0.274 | 195 |
| us-west-1 | 0.225 | 3547 |
| us-west-2 | 0.279 | 157 |

