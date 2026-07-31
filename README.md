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
Updated: 2026-07-31T19:11:10.637409+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.152 | 17 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.121 | 4925 |
| us-east-2 | 0.121 | 1673 |
| us-gov-east-1 | 0.122 | 1791 |
| us-gov-west-1 | 0.233 | 208 |
| us-west-1 | 0.175 | 3860 |
| us-west-2 | 0.232 | 172 |

