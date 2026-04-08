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
Updated: 2026-04-08T13:04:39.700977+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.053 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.587 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.716 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.772 |  |
| ap-southeast-4 | 0.644 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.820 |  |
| ca-central-1 | 0.280 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.607 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.767 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.686 |  |
| us-east-1 | 0.236 | 4456 |
| us-east-2 | 0.206 | 1489 |
| us-gov-east-1 | 0.209 | 1634 |
| us-gov-west-1 | 0.128 | 192 |
| us-west-1 | 0.072 | 3378 |
| us-west-2 | 0.127 | 154 |

