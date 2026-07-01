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
Updated: 2026-07-01T23:05:30.039156+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.840 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.775 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.115 | 4809 |
| us-east-2 | 0.147 | 1649 |
| us-gov-east-1 | 0.144 | 1727 |
| us-gov-west-1 | 0.257 | 200 |
| us-west-1 | 0.204 | 3726 |
| us-west-2 | 0.260 | 164 |

