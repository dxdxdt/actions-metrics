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
Updated: 2026-07-17T21:54:06.573490+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.702 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.153 | 4877 |
| us-east-2 | 0.147 | 1657 |
| us-gov-east-1 | 0.131 | 1764 |
| us-gov-west-1 | 0.206 | 203 |
| us-west-1 | 0.150 | 3793 |
| us-west-2 | 0.209 | 166 |

