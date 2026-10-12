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
Updated: 2026-10-12T18:25:20.710854+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.226 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.191 | 5144 |
| us-east-2 | 0.164 | 1695 |
| us-gov-east-1 | 0.200 | 1939 |
| us-gov-west-1 | 0.171 | 237 |
| us-west-1 | 0.118 | 4168 |
| us-west-2 | 0.171 | 194 |

