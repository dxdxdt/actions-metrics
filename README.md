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
Updated: 2026-08-23T03:43:21.786180+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.173 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.142 | 5048 |
| us-east-2 | 0.154 | 1681 |
| us-gov-east-1 | 0.129 | 1870 |
| us-gov-west-1 | 0.207 | 225 |
| us-west-1 | 0.160 | 4030 |
| us-west-2 | 0.207 | 184 |

