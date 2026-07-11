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
Updated: 2026-07-11T21:42:01.309691+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.153 | 4851 |
| us-east-2 | 0.170 | 1656 |
| us-gov-east-1 | 0.167 | 1738 |
| us-gov-west-1 | 0.214 | 202 |
| us-west-1 | 0.153 | 3769 |
| us-west-2 | 0.211 | 165 |

