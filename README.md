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
Updated: 2026-08-01T00:03:16.173758+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.892 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.677 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.268 | 17 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.196 | 4927 |
| us-east-2 | 0.218 | 1673 |
| us-gov-east-1 | 0.195 | 1791 |
| us-gov-west-1 | 0.174 | 208 |
| us-west-1 | 0.115 | 3862 |
| us-west-2 | 0.174 | 172 |

