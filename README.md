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
Updated: 2026-05-04T21:00:45.584802+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.173 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.126 | 4593 |
| us-east-2 | 0.108 | 1566 |
| us-gov-east-1 | 0.125 | 1673 |
| us-gov-west-1 | 0.233 | 194 |
| us-west-1 | 0.172 | 3532 |
| us-west-2 | 0.226 | 157 |

