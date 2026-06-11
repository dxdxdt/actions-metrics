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
Updated: 2026-06-11T10:10:11.827849+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.677 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.202 | 4742 |
| us-east-2 | 0.180 | 1631 |
| us-gov-east-1 | 0.184 | 1710 |
| us-gov-west-1 | 0.172 | 198 |
| us-west-1 | 0.113 | 3657 |
| us-west-2 | 0.171 | 162 |

