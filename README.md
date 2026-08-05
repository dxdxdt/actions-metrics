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
Updated: 2026-08-05T13:47:34.479830+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.835 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.151 | 17 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.105 | 4942 |
| us-east-2 | 0.121 | 1674 |
| us-gov-east-1 | 0.126 | 1802 |
| us-gov-west-1 | 0.260 | 211 |
| us-west-1 | 0.203 | 3886 |
| us-west-2 | 0.260 | 172 |

