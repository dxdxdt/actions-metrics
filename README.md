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
Updated: 2026-03-02T04:07:25.834079+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.190 |  |
| eu-central-1 | 0.521 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.843 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.174 | 4207 |
| us-east-2 | 0.146 | 1387 |
| us-gov-east-1 | 0.145 | 1520 |
| us-gov-west-1 | 0.172 | 167 |
| us-west-1 | 0.150 | 3155 |
| us-west-2 | 0.176 | 136 |

