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
Updated: 2026-02-23T18:54:04.923161+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.853 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.563 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.893 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.198 | 4172 |
| us-east-2 | 0.189 | 1371 |
| us-gov-east-1 | 0.194 | 1502 |
| us-gov-west-1 | 0.173 | 160 |
| us-west-1 | 0.120 | 3107 |
| us-west-2 | 0.174 | 130 |

