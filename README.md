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
Updated: 2026-09-16T08:08:32.146906+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.784 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.252 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.574 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.696 |  |
| me-central-1 | 0.944 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.660 |  |
| us-east-1 | 0.214 | 5101 |
| us-east-2 | 0.220 | 1686 |
| us-gov-east-1 | 0.211 | 1914 |
| us-gov-west-1 | 0.158 | 233 |
| us-west-1 | 0.097 | 4117 |
| us-west-2 | 0.164 | 192 |

