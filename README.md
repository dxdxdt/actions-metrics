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
Updated: 2026-03-03T15:40:48.938655+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.944 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.694 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.241 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.863 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.192 | 4212 |
| us-east-2 | 0.167 | 1394 |
| us-gov-east-1 | 0.172 | 1527 |
| us-gov-west-1 | 0.158 | 169 |
| us-west-1 | 0.134 | 3165 |
| us-west-2 | 0.161 | 137 |

