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
Updated: 2026-02-11T11:39:05.189351+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.872 |  |
| ap-east-1 | 0.815 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.739 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.944 |  |
| ap-southeast-4 | 0.829 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.379 |  |
| eu-central-2 | 0.394 |  |
| eu-north-1 | 0.425 |  |
| eu-south-1 | 0.407 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.300 |  |
| eu-west-2 | 0.335 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.543 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.733 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.054 | 4103 |
| us-east-2 | 0.099 | 1331 |
| us-gov-east-1 | 0.097 | 1451 |
| us-gov-west-1 | 0.327 | 143 |
| us-west-1 | 0.264 | 3039 |
| us-west-2 | 0.331 | 125 |

